# Aliaser
aliaser is a simple tool for easy set and get your common commands by alias .

## Installation

```bash
cd ~ && wget https://raw.githubusercontent.com/ahmedash95/aliaser/master/aliaser.sh
```

then open your terminal bashrc file .. if you are an ubuntu user then nano ~/.bashrc .. if you are using mac with iterm and zsh then i guess the it will be nano ~/.zshrc and put this command at the end of the file
```bash
alias aliaser='bash $HOME/aliaser.sh'
```

then refresh your terminal config 
```bash
source ~/.bashrc
```

now every thing should work perfect. lets try to write **aliaser** the output should be something like 
```bash
please use set or get command
set example : aliaser set listHome = 'ls ~'
get example : aliaser set listHome
```

## How to use ? 

oh , actually this is very easy

if you want to say my alias is [ mySSH ] and command is [ ssh root@ahmedash.me ] then you just need to exectue this command

```bash
aliaser set mySSH 'ssh root@ahmedash.me' 
```

and if you want to execute this command with your alias using Aliaser just execute

```bash
aliaser get mySSH
```

then the output will be something like 
```
executing :  ssh root@ahmedash.me
```
followed by your command output


## Contribution guidelines

Please report any issue you find in the issues page.

Pull requests are welcome.