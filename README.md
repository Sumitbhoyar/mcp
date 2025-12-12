# Playwright MCP Server

An MCP (Model Context Protocol) server that provides browser automation capabilities using Playwright. This allows you to navigate websites, extract content, and perform web tasks through simple prompts.

## Features

- **Navigate to URLs** - Open and load web pages
- **Extract page content** - Get text or HTML content from pages
- **Get page titles** - Retrieve page titles
- **Take screenshots** - Capture page screenshots
- **Interact with pages** - Click elements, type text, wait for selectors

## Installation

1. Install dependencies:
```bash
npm install
```

2. Install Playwright browsers:
```bash
npx playwright install chromium
```

## Configuration

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
           "C:\\path\\to\\mcp-practice\\src\\server.js"
         ],
         "cwd": "C:\\path\\to\\mcp-practice"
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
           "/full/path/to/mcp-practice/src/server.js"
         ],
         "cwd": "/full/path/to/mcp-practice"
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

## Usage

Once configured, you can use prompts like:

- "Navigate to https://example.com and summarize the page."
- "Go to https://example.com and get the page title."
- "Take a screenshot of https://example.com"
- "Navigate to https://example.com, click the button with selector '#submit', and tell me what happened."

## Available Tools

### navigate
Navigate to a URL and wait for the page to load.

**Parameters:**
- `url` (required): The URL to navigate to
- `waitUntil` (optional): When to consider navigation successful ('load', 'domcontentloaded', 'networkidle')

### get_page_content
Get the text content of the current page.

**Parameters:**
- `includeHtml` (optional): Whether to include HTML content (default: false)

### get_page_title
Get the title of the current page.

### screenshot
Take a screenshot of the current page.

**Parameters:**
- `fullPage` (optional): Whether to capture the full page or just the viewport (default: false)

### click
Click an element on the page.

**Parameters:**
- `selector` (required): CSS selector for the element to click

### type
Type text into an input field.

**Parameters:**
- `selector` (required): CSS selector for the input field
- `text` (required): The text to type

### wait_for_selector
Wait for an element to appear on the page.

**Parameters:**
- `selector` (required): CSS selector to wait for
- `timeout` (optional): Timeout in milliseconds (default: 30000)

## Development

To run the server directly (for testing):

```bash
npm start
```

Or:

```bash
node src/server.js
```

The server communicates via stdio, so it's designed to be used by MCP clients rather than run standalone.

## License

MIT