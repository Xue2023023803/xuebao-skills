# GitHub Publish Troubleshooting

Use this when the repository content is ready but the push path still fails.

## 1. Check the remote type

```bash
git remote -v
```

- If the remote starts with `https://`, Git uses HTTPS auth.
- If the remote starts with `git@github.com:`, Git uses SSH.

## 2. HTTPS auth rule

GitHub does not accept account passwords for Git operations.

Use:
- GitHub username
- `PAT` as the password value

If the user wants direct SSH instead, switch the remote to SSH.

## 3. SSH basic checks

```bash
ssh -T git@github.com
```

If this works, SSH auth is ready.

If it fails before authentication, the network may be blocking port 22.

## 4. SSH over port 443

Test:

```bash
ssh -T -p 443 git@ssh.github.com
```

If that works, configure:

```text
Host github.com
  HostName ssh.github.com
  User git
  Port 443
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes
```

Then test again:

```bash
ssh -T git@github.com
```

## 5. Direct vs proxy path

Before pushing, inspect:

```bash
env | grep -i proxy
git config --global --list | grep -i proxy
ssh -G git@github.com | grep -E '^(hostname|port|proxycommand|proxyjump|identityfile)'
```

Use this to decide whether the push will go direct, through Git proxy settings, or through a system-level tunnel.

## 6. Last-mile checklist

Before the final push:
- `git status` is clean
- remote URL is correct
- authentication path is tested
- README and repo layout match
- no accidental secrets or machine-local artifacts remain
