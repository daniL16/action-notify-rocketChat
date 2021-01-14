# action-notify-rocketChat

<p align="center">
  Send notify message to RocketChat
</p>

## 🚀 Usage

Create a file inside the `.github/workflows` directory and paste:

```yml

name: Send Chat Message

on:
  - push

jobs:
  test:
    runs-on: ubuntu-latest
    name: Test this PR
    steps:
      - uses: actions/checkout@v1
      - uses: daniL16/action-notify-rocketChat@v1.0.0
        with:
          ROCKET_CHAT_HOOK: "jx3Xu73zuxkYqkhMv"
          message: 'Test'

```
