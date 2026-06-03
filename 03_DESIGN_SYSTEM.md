# RoadSoS Flutter — Design System

> Emergency-first. Every pixel earns its place. The UI must function for someone with shaking hands, blurred vision from tears, or a cracked screen.

---

## 1. Design Philosophy

**Three Modes, One App**

| Mode | Emotional State | Design Response |
|------|----------------|-----------------|
| **Calm** (idle, browsing) | Relaxed, exploring | Spacious, readable, soft greys |
| **Alert** (volunteer dispatch, incident nearby) | Focused, adrenaline rising | Bold contrast, large tap targets |
| **Critical** (active SOS) | Panic, shock | Maximum contrast, single action per screen, zero decoration |

Transitions between modes are animated (400 ms ease-in-out). The SOS trigger always exists as a floating button regardless of mode.

---

## 2. Color System

### Semantic Tokens (Dart `ColorTokens`)

```dart
// Background
static const Color bgPrimary      = Color(0xFF0A0C10);  // near-black
static const Color bgSurface      = Color(0xFF141820);  // card surface
static const Color bgElevated     = Color(0xFF1E2330);  // modal, drawer

// Severity
static const Color severityCritical = Color(0xFFFF2D2D); // P1 red
static const Color severityHigh     = Color(0xFFFF8C00); // P2 orange
static const Color severityMedium   = Color(0xFFFFD600); // P3 amber
static const Color severityLow      = Color(0xFF4CAF50); // P4 green

// Accent
static const Color accentSOS       = Color(0xFFFF2D2D); // same as P1 — intentional
static const Color accentPrimary   = Color(0xFF2979FF); // interactive blue
static const Color accentSuccess   = Color(0xFF00E676); // confirmed/accepted

// Text
static const Color textPrimary     = Color(0xFFEEF0F5);
static const Color textSecondary   = Color(0xFF8A90A0);
static const Color textOnCritical  = Color(0xFFFFFFFF);

// Trust Score
static const Color trustHigh       = Color(0xFF00E676); // govt verified
static const Color trustMid        = Color(0xFFFFD600); // OSM verified
static const Color trustLow        = Color(0xFFFF8C00); // seed / user report

// Map
static const Color mapRoute        = Color(0xFF2979FF);
static const Color mapVictimPin    = Color(0xFFFF2D2D);
static const Color mapResponderPin = Color(0xFF00E676);
static const Color mapServicePin   = Color(0xFFFFD600);
```

### Light Mode (Dispatcher Dashboard)
Invert: `bgPrimary = 0xFFF5F7FA`, surfaces white, text dark. Use only for dispatcher/judge roles on tablet.

---

## 3. Typography

```dart
// Primary: Space Grotesk — geometric, authoritative, readable at small size
// Monospace: JetBrains Mono — incident IDs, coordinates, technical data
// Use Google Fonts package

static const TextStyle displayLarge = TextStyle(
  fontFamily: 'SpaceGrotesk',
  fontSize: 48, fontWeight: FontWeight.w700,
  letterSpacing: -1.5, height: 1.0,
  color: ColorTokens.textPrimary,
);

// SOS Button label
static const TextStyle sosTrigger = TextStyle(
  fontFamily: 'SpaceGrotesk',
  fontSize: 32, fontWeight: FontWeight.w800,
  letterSpacing: 4.0,
  color: Colors.white,
);

// Action plan steps
static const TextStyle actionStep = TextStyle(
  fontFamily: 'SpaceGrotesk',
  fontSize: 20, fontWeight: FontWeight.w500,
  height: 1.5,
);

// Coordinates / IDs
static const TextStyle mono = TextStyle(
  fontFamily: 'JetBrainsMono',
  fontSize: 13, fontWeight: FontWeight.w400,
  letterSpacing: 0.5,
);

// Severity badge
static const TextStyle severityBadge = TextStyle(
  fontFamily: 'SpaceGrotesk',
  fontSize: 14, fontWeight: FontWeight.w700,
  letterSpacing: 2.0,
);
```

---

## 4. Spacing & Sizing

```dart
// 8-point grid
const double spaceXS  =  4.0;
const double spaceSM  =  8.0;
const double spaceMD  = 16.0;
const double spaceLG  = 24.0;
const double spaceXL  = 32.0;
const double spaceXXL = 48.0;

// Tap targets (WCAG 2.1 minimum 44×44, prefer 56×56 for emergency)
const double minTapTarget    = 44.0;
const double emergencyTarget = 64.0;

// Border radius
const double radiusSM  =  8.0;
const double radiusMD  = 12.0;
const double radiusLG  = 16.0;
const double radiusXL  = 24.0;
const double radiusFull = 999.0;
```

---

## 5. Core Components

### SOS Trigger Button

The most important component in the app. Full-screen when no incident is active.

```
┌─────────────────────────────────┐
│                                 │
│                                 │
│         ╔═══════════╗           │
│         ║           ║           │
│         ║    SOS    ║  ← 180dp  │
│         ║           ║    circle │
│         ╚═══════════╝           │
│                                 │
│    ← Hold 2s for Voice SOS →    │
│                                 │
└─────────────────────────────────┘
```

- Base: 180dp circle, `severityCritical` fill
- Pulsing ring animation when active incident exists
- Haptic: `HapticFeedback.heavyImpact()` on tap
- Disabled state: grey + "Incident Active" label

### Severity Badge

```
┌──────────────┐
│ ● P1 CRITICAL│  16sp bold, 2pt letter spacing
└──────────────┘
```

Colours: P1=red, P2=orange, P3=amber, P4=green.
Always uppercase. Never lowercase.

### Trust Score Badge

```
┌─────────┐
│ ★ 0.87  │  ← colour-coded
└─────────┘
```

0.8–1.0 → trustHigh green
0.6–0.79 → trustMid amber
< 0.6 → trustLow orange

### Service Card

```
┌───────────────────────────────────────┐
│ 🏥 AIIMS Hospital          ★ 0.95    │
│    2.4 km                  Govt Verified│
│                                       │
│  [📞 Call]  [🗺 Navigate]  [ℹ Info]  │
└───────────────────────────────────────┘
```

- One-tap `url_launcher` for phone call: `tel:+911234567890`
- Navigate opens native maps deep link

### Action Plan Step

```
┌───────────────────────────────────────┐
│  ①  Stay in the vehicle unless       │
│     there is fire or smoke.          │
│                                      │
│  Turn on hazard lights.              │
└───────────────────────────────────────┘
```

Large (20sp), numbered, generous padding. Green checkmark on completion tap.

### Incident Status Timeline (Dispatcher)

```
──●──────────────────────────────────
  │ Triggered       08:32:14
  ●─────────────────────────────────
  │ Tier 0 Notified 08:32:16 (+2s)
  ●─────────────────────────────────
  │ Volunteer Acc.  08:32:45 (+31s)  ← animated pulse
  ○ (pending)
```

### Risk Score Ring

```dart
// AnimatedRing widget
// 0.0 → green, 0.5 → amber, 1.0 → red
// Uses CustomPainter + AnimationController
```

### WebSocket Status Pill

```
● Live   ← green, pulsing dot
◉ Reconnecting...
○ Offline
```

Always visible in the corner of active incident screen.

### Offline Mode Banner

```
┌────────────────────────────────────────────────┐
│  📡  No internet — Local SOS mode active       │
└────────────────────────────────────────────────┘
```

Persistent amber banner, never dismissible during incident.

---

## 6. Screen Wireframes

### 6.1 Home Screen (User Role)

```
┌────────────────────────────┐
│ RoadSoS         [👤] [⚙️]  │
├────────────────────────────┤
│                            │
│       ╔═══════════╗        │
│       ║           ║        │
│       ║    SOS    ║        │
│       ║           ║        │
│       ╚═══════════╝        │
│                            │
│  Hold 2s: Voice SOS        │
│                            │
├────────────────────────────┤
│ Nearby Services    [View→] │
│ 🏥 2.4km  🚔 1.1km  🔧 3.8km│
├────────────────────────────┤
│  [🚨 SOS] [🗺 Map] [🤖 Bot] [👤]│
└────────────────────────────┘
```

### 6.2 SOS Bundle Screen

```
┌────────────────────────────┐
│ ← Back         INCIDENT    │
│             abc-12345      │
├────────────────────────────┤
│  ┌──────────┐              │
│  │ P1       │  ████████░   │
│  │ CRITICAL │  Risk: 0.87  │
│  └──────────┘              │
├────────────────────────────┤
│ ACTION PLAN                │
│ ① Do not move unless...    │
│ ② Turn on hazard lights    │
│ ③ Call out to bystanders   │
│ ④ Ambulance en route 4 min │
├────────────────────────────┤
│ NEARBY SERVICES            │
│ [AIIMS  2.4km ★0.95 📞]   │
│ [Police 1.1km ★0.88 📞]   │
├────────────────────────────┤
│ 📞 Emergency: 112 | 102   │
└────────────────────────────┘
```

### 6.3 Active Incident (Live Map)

```
┌────────────────────────────┐
│ ← Incident  ● Live  TIER 0│
├────────────────────────────┤
│                            │
│   [  MAP  with pins  ]     │
│   [  victim = red    ]     │
│   [  responder = grn ]     │
│                            │
├────────────────────────────┤
│ Dr. Ayesha (Volunteer)     │
│ ★4.9 · ETA 3 min 400m away│
├────────────────────────────┤
│ [RESOLVE]     [CANCEL SOS] │
└────────────────────────────┘
```

### 6.4 Helper Bot

```
┌────────────────────────────┐
│ Helper Bot              🔍 │
├────────────────────────────┤
│                            │
│ [Bot]: I'm here to help    │
│ with road safety questions.│
│                            │
│ [User]: What if someone    │
│  has a spinal injury?      │
│                            │
│ [Bot]: ⚠️ Life risk?      │
│  → Trigger SOS first       │
│                            │
│ [Sources: WHO First Aid..]  │
├────────────────────────────┤
│ [_______________________]  │
│       [Send]    [📍 Add Loc]│
└────────────────────────────┘
```

---

## 7. Animation Spec

| Animation | Duration | Curve | Trigger |
|-----------|----------|-------|---------|
| SOS button pulse ring | 1200 ms | easeInOut, repeat | Active incident |
| Risk ring fill | 800 ms | decelerate | Bundle received |
| Action step reveal | 80 ms stagger | easeOut | Bundle received |
| Screen transition | 300 ms | easeInOut | Route change |
| Severity badge slide-in | 250 ms | bounceOut | First render |
| WebSocket event toast | 350 ms | easeOut | Event received |
| Escalation tier flash | 600 ms | easeIn (red flash) | Tier event |

---

## 8. Accessibility

- All interactive elements: min 44×44 dp
- Emergency elements: min 64×64 dp
- Contrast ratio: ≥ 7:1 for critical text (WCAG AAA)
- SOS button: Semantics label "Emergency SOS trigger"
- Voice SOS: alternative for motor impairment
- `MediaQuery.textScaleFactor` respected — layouts tested at 2×
- No critical info conveyed by colour alone (always badge text + icon)

---

## 9. Dark / Light Mode

Default: **Dark** (optimised for emergency night use).
Light mode auto-activates for dispatcher/judge role on tablet.
`ThemeMode.system` fallback for user preference.

---

## 10. Icon System

Use `phosphor_flutter` (Phosphor Icons) — comprehensive, consistent weight options.

```dart
PhosphorIcon(PhosphorIcons.siren, size: 28, color: ColorTokens.severityCritical)
PhosphorIcon(PhosphorIcons.heartbeat, size: 24)
PhosphorIcon(PhosphorIcons.mapPin, size: 20)
PhosphorIcon(PhosphorIcons.bluetooth, size: 20)
PhosphorIcon(PhosphorIcons.wifiX, size: 20) // offline state
PhosphorIcon(PhosphorIcons.shieldCheck, size: 20) // trust verified
```
