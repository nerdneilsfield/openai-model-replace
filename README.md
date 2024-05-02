# OpenAI Model Forwarding Server

## Description

This server application is built using the Gin framework in Go. It handles requests, modifies them according to a predefined model table, and forwards them to the OpenAI API. The response from the API is then relayed back to the client. This allows for dynamic switching of models based on the configuration without changing the client's request format.

## 描述

此服务器应用程序使用 Go 语言中的 Gin 框架构建。它处理请求，根据预定义的模型表修改它们，并将它们转发到 OpenAI API。然后将 API 的响应中继回客户端。这允许根据配置动态切换模型，而无需更改客户端的请求格式。

## Configuration

Before running the server, you need to set up a few environment variables and ensure you have a model table JSON file in the root directory named `model_table.json`. The default contents of the model table should look like this:

```json
{
  "gpt-3.5-turbo": "wangshenzhi/llama3-8b-chinese-chat-ollama-fp16",
  "gpt-3.5-turbo-instruct": "kimi",
  "gpt-4-turbo": "kimi",
  "gpt-4-vision-preview": "glm",
  "gpt-4-32k": "kimi",
  "gpt-3.5-turbo-16k": "kimi"
}
```

## 配置

在运行服务器之前，您需要设置一些环境变量，并确保在根目录中有一个名为`model_table.json`的模型表 JSON 文件。模型表的默认内容应如下所示：

## Running the Server

To run the server, you will need to have Go installed on your machine. Use the following commands to run the server:

```bash
go build -o main
./main
```

This will start the server on the host and port specified in your flags or environment variables.

## 运行服务器

要运行服务器，您需要在机器上安装 Go。使用以下命令运行服务器：

```bash
go build -o main
./main
```

这将在您的标志或环境变量中指定的主机和端口上启动服务器。

## Endpoints

The server has two main endpoints:

- `GET /`: Returns a simple help message.
- `POST /v1/chat/completions`: Accepts a JSON payload, modifies it according to the model table, and forwards it to the specified OpenAI API.

## 端点

服务器有两个主要端点：

- `GET /`：返回一个简单的帮助页面。
- `POST /v1/chat/completions`：接受一个 JSON 有效载荷，根据模型表修改它，并将其转发到指定的 OpenAI API。

## Contributing

Contributions are welcome. Please fork the repository and submit a pull request with your enhancements.

## 贡献

欢迎贡献。请 fork 仓库并提交一个带有您的增强功能的 pull 请求。

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=nerdneilsfield/openapi-model-replace&type=Date)](https://star-history.com/#nerdneilsfield/openapi-model-replace&Date)

## License

```text
MIT License

Copyright (c) 2024 DengQi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
