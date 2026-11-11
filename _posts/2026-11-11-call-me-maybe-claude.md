---
title: "Call Me Maybe, Claude 🤙🤙"
excerpt: "Claude Code can tell you when it's done, blocked or waiting for you. Two events, three sounds, no more staring at the terminal."
date: 2026-11-11T20:30:00+01:00
last_modified_at: 2026-11-11T20:30:00+01:00
toc: true
toc_label: "Table of Contents"
toc_icon: "chalkboard-teacher"
lang: en
ref: call-me-maybe-claude
header:
  og_image: /assets/images/call-me-maybe-claude.png
categories:
  - blog
tags:
  - english
  - ai
  - claude
  - devex
---

## The problem

🎵 *Hey, I just met you. And this is crazy. But here's my prompt, so call me, maybe?* 🤙

That has been my relationship with Claude Code since I started using it heavily a few weeks ago.
I wrote a prompt, pressed Enter, and then I waited.
Sometimes I watched the terminal like a pot of water.
Sometimes I switched to Slack/Discord, to the browser, or to a second Claude session.
Then I forgot about the first one 🤷 (damn [prospective memory](https://en.wikipedia.org/wiki/Prospective_memory)! 🤦)

Twenty minutes later I came back and found Claude sitting there, waiting for me to approve a `git push`.
Or it had finished 19 minutes ago, and I had lost the thread of what I asked.

The problem was never Claude being slow.
The problem was that Claude had no way to call me.

When I work with an agent, there are three moments where I need to know something happened:

1. **Claude finished and you didn't notice.** You lose minutes, and you lose the context of what you asked.
2. **Claude is blocked.** A permission prompt sits there while you think the agent is still working. The agent waits for you to approve a tool call or make a decision.
3. **Claude is waiting and you forgot.** It finished a while ago and your reply is still pending. No rush, but a reminder helps.

In the words of [Carly Rae Jepsen](https://www.youtube.com/watch?v=fWNaR-rxAic): *"You gave me nothin' at all, but still, you're in my way"* 🎶

## The solution: hooks

Claude Code has a built-in notification for when it finishes or waits for your permission.
It sends a desktop notification in iTerm2, Ghostty and Kitty.
In other terminals it does nothing, unless you set [`preferredNotifChannel`](https://code.claude.com/docs/en/terminal-config) to `"terminal_bell"`.
Either way, you get one signal for everything.
I wanted a different sound for each moment, in any terminal.
Hooks give me that, and they run alongside the built-in notification instead of replacing it.

[Claude Code hooks](https://code.claude.com/docs/en/hooks) are shell commands that run on specific events.
Two events cover the three problems above. The `matcher` splits `Notification` by type:

| Event and matcher | When it fires | What I want |
| --- | --- | --- |
| `Stop` | Claude finishes its response | "I'm done" 🔔 |
| `Notification`, `permission_prompt`, `elicitation_dialog` or `elicitation_url_dialog` | Claude has waited about 6 seconds for your approval, a form or a URL | "I'm blocked" 🚨 |
| `Notification`, `idle_prompt` | Claude finished about 60 seconds ago and you haven't typed since | "I'm waiting for you" 🎐 |

## Get the sounds

I use three free sounds from [Mixkit](https://mixkit.co/free-sound-effects/notification/).
They work on Linux and macOS.

| Moment                | Mixkit name             | Length | Direct download                                                       |
| --------------------- | ----------------------- | ------ | --------------------------------------------------------------------- |
| "I'm done"            | Positive notification   | 2.8 s  | [951.wav](https://assets.mixkit.co/active_storage/sfx/951/951.wav)    |
| "I'm blocked"         | Software interface back | 1.3 s  | [2575.wav](https://assets.mixkit.co/active_storage/sfx/2575/2575.wav) |
| "I'm waiting for you" | Magic notification ring | 3.0 s  | [2344.wav](https://assets.mixkit.co/active_storage/sfx/2344/2344.wav) |

The [Mixkit Sound Effects Free License](https://mixkit.co/license/#sfxFree) lets you use them for free, with no attribution.
It does not let you share the files on their own, so download them from Mixkit instead of copying them from someone's repository:

```bash
mkdir -p ~/.claude/sounds
curl -fsSL https://assets.mixkit.co/active_storage/sfx/951/951.wav -o ~/.claude/sounds/on-agent-complete-positive-notification.wav
curl -fsSL https://assets.mixkit.co/active_storage/sfx/2575/2575.wav -o ~/.claude/sounds/on-agent-need-attention-software-interface-back.wav
curl -fsSL https://assets.mixkit.co/active_storage/sfx/2344/2344.wav -o ~/.claude/sounds/on-agent-idle-magic-notification-ring.wav
paplay ~/.claude/sounds/on-agent-complete-positive-notification.wav  # on macOS: afplay
```

*In practice, I keep the files in a private repository.
My dotfiles install script downloads them from Mixkit when a new machine is missing them, so every machine I set up gets the same sounds.*

## My setup on Ubuntu

Add this to `~/.claude/settings.json`.
If the file already exists, merge the `hooks` key into it instead of replacing the file:

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "paplay ~/.claude/sounds/on-agent-complete-positive-notification.wav >/dev/null 2>&1 || true",
            "async": true
          }
        ]
      }
    ],
    "Notification": [
      {
        "matcher": "permission_prompt|elicitation_dialog|elicitation_url_dialog",
        "hooks": [
          {
            "type": "command",
            "command": "paplay ~/.claude/sounds/on-agent-need-attention-software-interface-back.wav >/dev/null 2>&1 || true",
            "async": true
          }
        ]
      },
      {
        "matcher": "idle_prompt",
        "hooks": [
          {
            "type": "command",
            "command": "paplay ~/.claude/sounds/on-agent-idle-magic-notification-ring.wav >/dev/null 2>&1 || true",
            "async": true
          }
        ]
      }
    ]
  }
}
```

A few details:

- `paplay` plays a file through PulseAudio or PipeWire, available on most Linux desktops. For macOS, see the next section.
- `>/dev/null 2>&1 || true` keeps the hook quiet and successful, even when the file is missing or there is no audio device.
- `"async": true` lets Claude carry on without waiting for the sound to finish.
- **The three sounds are different on purpose**. The **"done"** sound is bright. The **"blocked"** sound is short and sharp. The **"waiting"** sound is soft and quiet, a reminder rather than an alarm. After two days my brain knew which one meant "come back now".
- `elicitation_dialog` and `elicitation_url_dialog` share the "blocked" sound: they fire when an MCP server asks you to fill in a form or open a URL, and Claude can't continue until you do.
- **The `Notification` sounds wait until you seem away.** They fire only when Claude Code thinks you are away from the terminal: about 6 seconds after a prompt appears, or 60 seconds after Claude finishes, and only if you haven't typed since. If you keep typing while you test, you won't hear them. The `Stop` sound plays every time.

To check that Claude Code loaded them, type `/hooks` in a session.
It lists every hook, its matcher, and the settings file it came from.

## On macOS

Replace `paplay` with `afplay` in the three commands, and the Mixkit sounds work the same way.

macOS also ships its own alert sounds in `/System/Library/Sounds/`: Basso, Blow, Bottle, Frog, Funk, Glass, Hero, Morse, Ping, Pop, Purr, Sosumi, Submarine and Tink.
Listen to them with `afplay`:

```bash
ls /System/Library/Sounds/
afplay /System/Library/Sounds/Glass.aiff
```

To use them, point the commands at their path, for example `Glass.aiff` for "done" and `Funk.aiff` for "blocked".
Listen to the list and pick the softest one for "waiting":

```json
"command": "afplay /System/Library/Sounds/Glass.aiff >/dev/null 2>&1 || true"
```

Use them where they are.
The [macOS license](https://www.apple.com/legal/sla/) does not allow copying them to a non-Apple computer, so a Linux machine needs the Mixkit sounds.

## Going further

- **Desktop notifications.** For when you mute your audio. In iTerm2, Ghostty and Kitty, Claude Code already sends them (see `preferredNotifChannel` above). In other terminals, add `notify-send "Claude Code" "Needs your attention"` (Linux) or `osascript -e 'display notification "Needs your attention" with title "Claude Code"'` (macOS) next to the sound.
- **Fewer sounds.** Drop the `idle_prompt` entry if one reminder per finished turn is enough for you.
- **Subagents.** `SubagentStop` fires when a subagent finishes. I don't use it: one sound per main turn is enough noise.

## Was it worth it?

Yes. Around 10 minutes of setup (or ask Claude! 😝), and I stopped babysitting the terminal: I run sessions in parallel and none of them gets stuck in silence.

And another change surprised me: I approve fewer things on autopilot.
When the "blocked" sound plays, I know Claude is asking for something specific, so I read what it asks.

Claude calls me. No "maybe" needed 🤙

## References

- [OGQhris/claude-code-notifcations](https://github.com/OGQhris/claude-code-notifcations): where I found my first two sounds
- [Claude Code hooks reference](https://code.claude.com/docs/en/hooks)
- [How To Make Claude Notify You When It's Done (Audio Script)](https://www.youtube.com/watch?v=mC1QCJn42MI)
- [Stop Babysitting: Let Claude Notify You When It Needs Input](https://medium.com/@anmolsahu2k/stop-babysitting-let-claude-notify-you-when-it-needs-input-0f21d7d1dee6)
- [Awesome Claude Code Sound Notifications](https://github.com/pascalporedda/awesome-claude-code)
- [Carly Rae Jepsen: Call Me Maybe (video)](https://www.youtube.com/watch?v=fWNaR-rxAic)

<!-- DOCTOC SKIP -->
