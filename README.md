# action-notify-rocketChat

<p align="center">
  Send notify message to RocketChat
</p>

## Args

 - ROCKET_CHAT_URL (required) : Rocket chat server
 - message (required)
 - ROCKET_CHAT_HOOK (optional): Group hook for group messages
 - ROCKET_CHAT_USER (required for private messages): User for authenticate
 - ROCKET_CHAT_PASS (required for private messages): Password for authenticate 
 - MESSAGE_TO (required for private messages): ;essage recipient
 - BOT_NAME: Sender's alias 
 - BOT_AVATAR : Sender's avatar 
 
## 🚀 Usage

Create a file inside the `.github/workflows` directory and paste:

### Message to a group.


```yml

name: Test group message

on:
  pull_request:
    types: 
      - opened

jobs:
  test:
    runs-on: ubuntu-latest
    name: Test
    steps:
      - uses: actions/checkout@v1
      - uses: ./
        with:
          message: ${{ github.event.pull_request.html_url }}
          ROCKET_CHAT_HOOK: ${{ secrets.ROCKET_CHAT_HOOK }}
          ROCKET_CHAT_URL: ${{ secrets.ROCKET_CHAT_HOST }}
          BOT_NAME: 'Harold'
          BOT_AVATAR: 'https://media.metrolatam.com/2019/10/16/18ps27-638137169a2d73f9f63481c115a7f092.jpg'


```

### Message to an user.

```yml

name: Test private message

on:
  - push

jobs:
  test:
    runs-on: ubuntu-latest
    name: Test
    steps:
      - uses: actions/checkout@v1
      - uses: ./
        with:
          message: 'Test'
          ROCKET_CHAT_USER: ${{ secrets.ROCKET_CHAT_USER }}
          ROCKET_CHAT_PASS: ${{ secrets.ROCKET_CHAT_PASS }}
          ROCKET_CHAT_URL: ${{ secrets.ROCKET_CHAT_HOST }}
          MESSAGE_TO: daniel.lopez
          BOT_NAME: 'Pingu'
          BOT_AVATAR: 'https://i.pinimg.com/originals/bd/5c/46/bd5c46c4c1579c56c60920301ea3e642.png'

```
