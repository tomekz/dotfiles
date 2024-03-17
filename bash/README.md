# Change the default shell to bash on MAC

In order to make use of latest bash version you need to change the default shell on your mac to bash:

- Install desired bash: `brew install bash`

- Confirm the path: `/opt/homebrew/bin/bash --version` (If it's different, adapt the below accordingly).

- `sudo vim /etc/shells` and insert `/opt/homebrew/bin/bash` at the top of the list. This is so the next instruction will succeed.

- Change default login shell: `chsh -s /opt/homebrew/bin/bash`

Close and reopen your terminal program, and echo $SHELL to confirm the running shell is indeed /opt/homebrew/bin/bash
