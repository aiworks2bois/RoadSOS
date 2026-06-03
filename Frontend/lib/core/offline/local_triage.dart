/// Dart port of app/services/classifier.py
///
/// This is a 1:1 port of the Python deterministic triage engine.
/// The SOS path is deterministic — no LLM, no Gemini, no RAG runs here.
///
/// SYNC RULE: Keep this file in sync with classifier.py manually.
/// Add a comment with date when syncing: "Last synced: YYYY-MM-DD"
///
/// Last synced: 2026-06-03
/// Source: app/services/classifier.py (RoadSoS backend)
library;

// ── Term banks (exact copy of Python tuples) ─────────────────────────────────

const _p1Terms = [
  'not breathing', 'unconscious', 'unresponsive', 'not responding', 'no pulse',
  'no heartbeat', 'cardiac arrest', 'heart stopped', 'only gasping', 'gasping',
  'stopped breathing', 'cannot breathe', 'major bleeding', 'heavy bleeding',
  'bleeding out', 'blood everywhere', 'blood not stopping', "blood won't stop",
  'deep cut', 'amputation', 'limb severed', 'arterial bleeding', 'severe head injury',
  'skull fracture', 'cannot move legs', 'paralyzed', 'spinal injury', 'trapped',
  'pinned', 'crushed', 'stuck under vehicle', 'cannot open door', 'stuck inside',
  'vehicle fire', 'car fire', 'engine fire', 'explosion', 'person on fire',
  'smoke inhalation', 'electrocuted', 'electric shock', 'high voltage',
  'exposed wire', 'exposed cable', 'drowning', 'submerged', 'sinking',
  'car in water', 'vehicle in water', 'swept away', 'severe crash', 'rollover',
  'hit and run injured', 'pileup', 'multi vehicle', 'multiple vehicles',
  'head on collision', 'wrong way driver', 'gunshot', 'stabbed', 'knife wound',
  'shot', 'machete', 'gun visible', 'knife visible', 'weapon visible',
  'heart attack', 'cardiac', 'choking', 'child not breathing',
  'baby not breathing', 'infant choking',
];

const _p2Terms = [
  'head injury', 'neck pain after crash', 'back pain after crash', 'helmet damage',
  'thrown from bike', 'ev crash', 'electric vehicle', 'hybrid vehicle',
  'battery fire', 'orange cable', 'battery leak', 'fuel leak', 'petrol leak',
  'diesel leak', 'gas smell', 'chemical spill', 'hazmat', 'hazardous material',
  'fumes', 'tanker', 'chemical leak', 'bike accident', 'motorcycle', 'scooter crash',
  'rider down', 'pedestrian hit', 'cyclist hit', 'hit by car', 'person on road',
  'run over', 'highway crash', 'highway accident', 'breakdown in traffic',
  'stalled in traffic', 'highway breakdown', 'stranded on highway', 'assault',
  'harassment', 'followed', 'robbery', 'stalking', 'road rage', 'threat',
  'weapon', 'aggressive driver', 'chased', 'attacked', 'breathing problem',
  'chest pain', 'stroke', 'seizure', 'fracture', 'broken bone', 'allergic reaction',
  'anaphylaxis', 'diabetic emergency', 'fainting', 'asthma attack', 'pregnant',
  'child injured', 'elderly injured', 'child in car', 'baby in car',
  'pregnant woman', 'elderly person', 'disabled person', 'wheelchair', 'heatstroke',
  'hypothermia', 'heat exhaustion', 'animal collision', 'cow on road', 'deer on road',
  'livestock on highway', 'landslide', 'tree fallen', 'road blocked',
  'debris on road', 'stranded at night', 'alone at night',
];

const _p3Terms = [
  'injury', 'pain', 'stuck', 'minor bleeding', 'lost', 'panic', 'sprain',
  'unable to move', 'stranded', 'accident', 'collision', 'fender bender',
  'car crash', 'vehicle damage', 'dent', 'bumper', 'cannot move', 'dehydration',
  'exhaustion', 'dizzy', 'nauseous', 'confusion', 'disoriented', 'vomiting',
  'stuck in rain', 'cold', 'faint', 'animal on road', 'dog on road',
];

const _p4Terms = [
  'flat tire', 'puncture', 'tyre burst', 'breakdown', 'battery dead', 'out of fuel',
  'tow', 'mechanic', 'lost keys', 'locked out', 'key stuck', 'overheating',
  'radiator', 'engine light', 'check engine', 'coolant', 'windshield cracked',
  'wiper broken', 'headlight broken', 'fog light',
];

// Used by HelperBotScreen to show inline SOS prompt before sending to API.
// Must match EMERGENCY_KEYWORDS frozenset in classifier.py.
const Set<String> emergencyKeywords = {
  ..._p1Terms,
  'chest pain', 'stroke', 'seizure', 'anaphylaxis', 'assault', 'weapon',
  'attacked', 'pedestrian hit', 'cyclist hit', 'fuel leak', 'chemical spill',
  'battery fire', 'ev crash', 'heatstroke', 'hypothermia', 'breathing problem',
  'asthma attack',
};

// ── Compound critical terms ───────────────────────────────────────────────────

const _fuelOrChemical = ['fuel leak', 'petrol leak', 'diesel leak', 'gas smell', 'chemical spill', 'chemical leak', 'tanker'];
const _fireOrExplosion = ['vehicle fire', 'car fire', 'engine fire', 'explosion', 'person on fire'];
const _pedestrianOrRider = ['pedestrian hit', 'cyclist hit', 'hit by car', 'run over', 'motorcycle', 'rider down', 'bike accident'];
const _medicalCompound = ['chest pain', 'stroke', 'seizure', 'breathing problem', 'anaphylaxis'];
const _p1ContextTerms = [
  'not breathing', 'unconscious', 'unresponsive', 'no pulse', 'heavy bleeding',
  'major bleeding', 'blood everywhere', 'vehicle fire', 'car fire', 'engine fire',
  'explosion', 'trapped', 'pinned', 'drowning',
];

// ── Result ────────────────────────────────────────────────────────────────────

class TriageResult {
  final String priority;
  final double confidence;
  final String etaDescription;

  const TriageResult({
    required this.priority,
    required this.confidence,
    required this.etaDescription,
  });

  bool get isCritical => priority == 'P1_CRITICAL';
  bool get isHigh => priority == 'P2_HIGH';

  @override
  String toString() => 'TriageResult($priority, ${confidence.toStringAsFixed(2)})';
}

// ── Core classifier ───────────────────────────────────────────────────────────

/// Fast deterministic triage — ≤200ms, no network, no LLM.
///
/// Port of [classify_emergency] from app/services/classifier.py.
/// Must produce priority within ±1 level of backend for consistent UX.
TriageResult localTriage({
  required String description,
  double impactForce = 0,
  bool airbagDeployed = false,
  bool rolloverDetected = false,
  String source = 'manual',
}) {
  final text = description.toLowerCase().trim();

  // Sensor override — hardware signals are more reliable than keywords.
  final sensorCritical = impactForce >= 8.0 || airbagDeployed || rolloverDetected;
  final sensorHigh = impactForce >= 5.0;

  if (sensorCritical) {
    return TriageResult(priority: 'P1_CRITICAL', confidence: 1.0, etaDescription: _eta('P1_CRITICAL'));
  }
  if (sensorHigh) {
    if (_containsAny(text, _p1Terms)) {
      return TriageResult(priority: 'P1_CRITICAL', confidence: 1.0, etaDescription: _eta('P1_CRITICAL'));
    }
    return TriageResult(priority: 'P2_HIGH', confidence: 0.90, etaDescription: _eta('P2_HIGH'));
  }

  // Compound critical checks.
  if (_compoundCritical(text)) {
    return TriageResult(priority: 'P1_CRITICAL', confidence: 0.94, etaDescription: _eta('P1_CRITICAL'));
  }

  // Rule matching — order: P1, P2, P4, P3 (mirrors RULES tuple in Python).
  final rules = [
    (_p1Terms, 'P1_CRITICAL', 0.97),
    (_p2Terms, 'P2_HIGH', 0.84),
    (_p4Terms, 'P4_LOW', 0.35),
    (_p3Terms, 'P3_MEDIUM', 0.62),
  ];

  for (final (terms, priority, baseScore) in rules) {
    final hits = _countHits(text, terms);
    if (hits == 0) continue;
    var score = baseScore;
    if (priority != 'P1_CRITICAL') {
      score = (score + (hits >= 2 ? 0.02 : 0)).clamp(0.0, 0.90);
    } else if (hits >= 2) {
      score = (score + 0.02).clamp(0.0, 0.99);
    }
    final (finalPriority, finalScore) = _applySourceUplift(priority, score, source);
    return TriageResult(
      priority: finalPriority,
      confidence: double.parse(finalScore.toStringAsFixed(2)),
      etaDescription: _eta(finalPriority),
    );
  }

  // Default fallback.
  final (priority, score) = _applySourceUplift('P3_MEDIUM', 0.50, source);
  return TriageResult(
    priority: priority,
    confidence: double.parse(score.toStringAsFixed(2)),
    etaDescription: _eta(priority),
  );
}

/// Returns true if the text contains any emergency keyword.
/// Used by HelperBotScreen to show SOS prompt.
bool detectsEmergencyKeywords(String text) {
  final lower = text.toLowerCase();
  return emergencyKeywords.any((k) => lower.contains(k));
}

// ── Helpers ───────────────────────────────────────────────────────────────────

bool _containsAny(String text, List<String> terms) =>
    terms.any((t) => text.contains(t));

int _countHits(String text, List<String> terms) =>
    terms.where((t) => text.contains(t)).length;

bool _compoundCritical(String text) {
  if (_containsAny(text, _fuelOrChemical) && _containsAny(text, _fireOrExplosion)) return true;
  if (_containsAny(text, _pedestrianOrRider) && _containsAny(text, _p1ContextTerms)) return true;
  if (_countHits(text, _medicalCompound) >= 2) return true;
  return false;
}

(String, double) _applySourceUplift(String priority, double score, String source) {
  const order = {'P1_CRITICAL': 0, 'P2_HIGH': 1, 'P3_MEDIUM': 2, 'P4_LOW': 3};
  final rank = order[priority] ?? 3;
  if (source == 'silent' && rank > 1) return ('P2_HIGH', score < 0.80 ? 0.80 : score);
  if (source == 'bystander' && rank > 2) return ('P3_MEDIUM', score < 0.60 ? 0.60 : score);
  return (priority, score);
}

String _eta(String priority) => switch (priority) {
      'P1_CRITICAL' => '2–6 minutes if responders are nearby; official services escalated immediately.',
      'P2_HIGH'     => '3–8 minutes; nearby volunteers and services are being notified.',
      'P3_MEDIUM'   => '5–12 minutes; nearby helpers are being matched.',
      'P4_LOW'      => '10–20 minutes; non-critical assistance is being matched.',
      _             => '5–12 minutes',
    };
