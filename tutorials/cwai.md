# Comwork AI

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/tutorials/cwai.md)

## Purpose

This feature aims to expose AI[^1] models such as NLP[^2] or LLM[^3] to be exposed as an API.

[^1]: _Artificial intelligence_
[^2]: _Natural language processing_
[^3]: _Large language model_

## Enabling this API

In the SaaS version, you can ask to be granted using the [support system](./console/public/support.md).

If you're admin of the instance, you can grant users like this:

![cwai_enable](../img/cwai_enable.png)

## UI chat

Once you're enabled, you can try the CWAI api using this chat web UI:

![cwai_chat](../img/cwai_chat.png)

## Use the API

Of course, the main purpose is to be able to interact with those model using very simple http endpoints:

![cwai_api](../img/cwai_api.png)

Here's how to get all the available models:

```shell
curl -X 'GET' 'https://cloud-api.comwork.io/v1/ai/models' -H 'accept: application/json' -H 'X-Auth-Token: XXXXXX'
```

Result:

```json
{
  "models": [
    "gpt2",
    "nlptownsentiment",
    "mock"
  ],
  "status": "ok"
}
```

Then prompting with one of the available models:

```shell
curl -X 'POST' \
  'https://cloud-api.comwork.io/v1/ai/prompt' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -H 'X-Auth-Token: XXXXXX' \
  -d '{
  "model": "nlptownsentiment",
  "message": "This is bad !",
  "settings": {}
}'
```

The answer would be:

```json
{
  "response": [
    "The predicted emotion is: Anger"
  ],
  "score": 1,
  "status": "ok"
}
```

Notes:
* you have to replace the `XXXXXX` value with your own token generated with [this procedure](./api/api_credentials.md).
* you can replace `https://cloud-api.comwork.io` by the API's instance URL you're using, with the `CWAI_API_URL` environment variable. For the Tunisian customers for example, it would be `https://api.cwcloud.tn`.

## Use the CLI

You can use the [`cwc` CLI](./cli/README.md) which provide a subcommand `ai`:

```shell
cwc ai
This command lets you call the CWAI endpoints

Usage:
  cwc ai
  cwc ai [command]

Available Commands:
  models      Get the available models
  prompt      Send a prompt

Flags:
  -h, --help   help for ai

Use "cwc ai [command] --help" for more information about a command.
```

### List the available models

```shell
cwc ai models
Models
[gpt2 nlptownsentiment nltksentiment textblobsentiment mock]
```

### Send a prompt to an available model

```shell
cwc ai prompt
Error: required flag(s) "message", "model" not set
Usage:
  cwc ai prompt [flags]

Flags:
  -h, --help             help for prompt
  -m, --message string   The message input
  -t, --model string     The chosen model
cwc ai prompt --model nltksentiment --message "This is bad"
Status	Response	Score
ok	[The predicted sentiment is: negative, score: -0.5423]	-0.5423
```

### Load a model asynchronously

```shell
cwc ai load [model]
Error: accepts 1 arg(s), received 0
Usage:
  cwc ai load [model] [flags]

Flags:
  -h, --help   help for load

exit status 1
```

## Driver interface

This section is for contributors who wants to add new models.

You can implement you're own adapter that will load and generate answer from models implementing this abstract[^1]:

```python
class ModelAdapter(ABC):
    @abstractmethod
    def load_model(self):
        pass

    @abstractmethod
    def generate_response(self, prompt: Prompt):
        pass
```

The you have to update this list[^2] with your new adapter:

```python
_default_models = [
    'gpt2',
    'nlptownsentiment',
    'nltksentiment',
    'textblobsentiment',
    'robertaemotion',
    'log'
]
```

[^1]: The adapters and the abstract are located in the package `src/adapters/ai`
[^2]: The list is defined in the `src/utils/ai/default_values.py` file
