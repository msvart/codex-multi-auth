# Codex Multi-Auth

Quickly switch between multiple chatgpt accounts - this one is for personal and business accounts without re-authenticating each time.

<p align="left">
  <a href="https://github.com/msvart/codex-multi-auth/issues/new" target="_blank" rel="noopener">
    <img src="https://img.shields.io/badge/Get%20Help-Ask%20a%20Question%20or%20Open%20an%20Issue-blue?style=for-the-badge" alt="Ask a question or open an issue">
  </a>
</p>

---

## Step 1 — Save Your Personal Profile

1. Sign in with your personal account.
   ```bash
   codex auth login
   ```
2. After Codex exits, move the config to a dedicated file.
   ```bash
   mv ~/.codex/auth.json ~/.codex/private_auth.json
   ```

## Step 2 — Save Your Business Profile

1. Launch Codex again; it prompts for login. Sign in with your business account.
2. After Codex exits, copy the config so the business profile is preserved.
   ```bash
   cp ~/.codex/auth.json ~/.codex/business_auth.json
   ```

## Step 3 — Install the Profile Switcher

1. Make the script executable.
   ```bash
   chmod +x ~/.codex/auth_folder/codex-profile.sh
   ```
2. Add convenient aliases (example for Bash).
   ```bash
   echo "alias codex-private='~/.codex/auth_folder/codex-profile.sh private'" >> ~/.bashrc
   echo "alias codex-business='~/.codex/auth_folder/codex-profile.sh business'" >> ~/.bashrc
   source ~/.bashrc
   ```

## Step 4 — Use It

```bash
codex-private
# or
codex-business
```

## POC

```
[user@host .codex]$ codex-private
✅ Switched Codex to PRIVATE profile
…
Account: XX@XX.com (Plus)

[user@host .codex]$ codex-business
✅ Switched Codex to BUSINESS profile
…
Account: XX@XX.com (Team)
```

## Optional — Expand Beyond Two Profiles

1. Repeat the same flow for every additional profile you want to manage.
2. Update `codex-profile.sh` with another case block and add the matching alias to `.bashrc`.
3. Need a hand or have feedback? Click the button above to ask a question or open an issue.
