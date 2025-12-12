# MCP Practice - Collection of MCP Servers

This repository contains a collection of MCP (Model Context Protocol) servers, each providing different functionality for AI assistants.

## 📦 Available Servers

### 🎭 Playwright Browser (`servers/playwright-browser`)
Browser automation server using Playwright. Navigate websites, extract content, take screenshots, and interact with web pages.

**Features:**
- Navigate to URLs
- Extract page content (text or HTML)
- Get page titles
- Take screenshots
- Click elements, type text, wait for selectors

See [servers/playwright-browser/README.md](servers/playwright-browser/README.md) for detailed documentation.

## 🚀 Quick Start

### Installation

1. Install all dependencies:
```bash
npm run install:all
```

2. Install Playwright browsers (for playwright-browser server):
```bash
npm run setup:playwright
```

Or install dependencies for a specific server:
```bash
cd servers/playwright-browser
npm install
npx playwright install chromium
```

## ⚙️ Configuration

### For Cursor IDE

Cursor uses an MCP configuration file located at:
- **Windows:** `%USERPROFILE%\.cursor\mcp.json` (e.g., `C:\Users\YourName\.cursor\mcp.json`)
- **macOS/Linux:** `~/.cursor/mcp.json`

#### Quick Setup (Windows)

1. **Automated setup:** Run the provided PowerShell script:
   ```powershell
   powershell -ExecutionPolicy Bypass -File setup-cursor-config.ps1
   ```

2. **Manual setup:** Create or edit the file at `C:\Users\YourName\.cursor\mcp.json` and add:

   ```json
   {
     "mcpServers": {
       "playwright-browser": {
         "command": "node",
         "args": [
           "C:\\path\\to\\mcp-practice\\servers\\playwright-browser\\src\\server.js"
         ],
         "cwd": "C:\\path\\to\\mcp-practice\\servers\\playwright-browser"
       }
     }
   }
   ```

   **Important:** Replace `C:\\path\\to\\mcp-practice` with the actual path to your project directory.

#### Quick Setup (macOS/Linux)

1. Create the directory if it doesn't exist:
   ```bash
   mkdir -p ~/.cursor
   ```

2. Create or edit `~/.cursor/mcp.json`:
   ```json
   {
     "mcpServers": {
       "playwright-browser": {
         "command": "node",
         "args": [
           "/full/path/to/mcp-practice/servers/playwright-browser/src/server.js"
         ],
         "cwd": "/full/path/to/mcp-practice/servers/playwright-browser"
       }
     }
   }
   ```

#### After Configuration

1. **Restart Cursor** completely for the changes to take effect
2. The MCP server will automatically start when you use browser-related prompts
3. Verify it's working by trying: "Navigate to https://example.com and summarize the page"

### For Claude Desktop (Alternative)

If you're using Claude Desktop instead:
- **Windows:** `%APPDATA%\Claude\claude_desktop_config.json`
- **macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Linux:** `~/.config/Claude/claude_desktop_config.json`

## 📝 Adding a New MCP Server

To add a new MCP server:

1. Create a new directory under `servers/`:
   ```bash
   mkdir servers/your-server-name
   mkdir servers/your-server-name/src
   ```

2. Create a `package.json` in the new server directory with:
   - Server-specific dependencies
   - A `start` script pointing to your server entry point

3. Create your server implementation in `servers/your-server-name/src/server.js`

4. Update `setup-cursor-config.ps1` to include your new server in the configuration

5. Add documentation in `servers/your-server-name/README.md`

## 🏗️ Project Structure

```
mcp-practice/
├── servers/                    # All MCP servers
│   ├── playwright-browser/    # Playwright browser automation server
│   │   ├── src/
│   │   │   └── server.js      # Server implementation
│   │   ├── package.json       # Server dependencies
│   │   └── README.md          # Server documentation
│   └── [future servers...]    # Add more servers here
├── package.json               # Root workspace configuration
├── setup-cursor-config.ps1    # Cursor configuration setup script
├── cursor-mcp-config.json     # Example Cursor config
├── mcp-config.json            # Example MCP config
└── README.md                  # This file
```

## 📚 Usage Examples

### Playwright Browser Server

Once configured, you can use prompts like:

- "Navigate to https://example.com and summarize the page."
- "Go to https://example.com and get the page title."
- "Take a screenshot of https://example.com"
- "Navigate to https://example.com, click the button with selector '#submit', and tell me what happened."

## 🔧 Development

### Running a Server Directly

To test a server directly:

```bash
cd servers/playwright-browser
npm start
```

Or:

```bash
node servers/playwright-browser/src/server.js
```

Note: Servers communicate via stdio, so they're designed to be used by MCP clients rather than run standalone.

## 📄 License

MIT