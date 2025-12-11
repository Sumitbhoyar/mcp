# Cursor MCP Configuration - Quick Guide

## ✅ Configuration Complete!

The MCP server has been configured for Cursor. The configuration file is located at:

**Windows:** `C:\Users\sumit\.cursor\mcp.json`

## 📋 What Was Configured

The configuration file contains:
```json
{
  "mcpServers": {
    "playwright-browser": {
      "command": "node",
      "args": [
        "D:\\Sumit\\Code\\vibe\\mcp-practice\\src\\server.js"
      ],
      "cwd": "D:\\Sumit\\Code\\vibe\\mcp-practice"
    }
  }
}
```

## 🚀 Next Steps

1. **Restart Cursor** - Close and reopen Cursor completely for the MCP server to be recognized

2. **Test it out** - Once Cursor restarts, try prompts like:
   - "Navigate to https://example.com and summarize the page"
   - "Go to https://example.com and get the page title"
   - "Take a screenshot of https://example.com"

## 🔧 Troubleshooting

If the MCP server doesn't work after restarting:

1. **Check Node.js is available:**
   ```powershell
   node --version
   ```

2. **Verify the server file exists:**
   ```powershell
   Test-Path "D:\Sumit\Code\vibe\mcp-practice\src\server.js"
   ```

3. **Test the server manually:**
   ```powershell
   cd D:\Sumit\Code\vibe\mcp-practice
   node src/server.js
   ```
   (Press Ctrl+C to exit - this tests if the server starts without errors)

4. **Check Cursor's logs** - Look for MCP-related errors in Cursor's developer console (Help > Toggle Developer Tools)

## 📝 Editing the Configuration

To modify the configuration later, edit:
- **Windows:** `C:\Users\sumit\.cursor\mcp.json`

Or run the setup script again:
```powershell
powershell -ExecutionPolicy Bypass -File setup-cursor-config.ps1
```

## 🎯 How It Works

When you ask Cursor to navigate to a website, it will:
1. Use the `navigate` tool to open the URL
2. Use the `get_page_content` tool to extract text
3. Provide you with a summary of the page content

All of this happens automatically through the MCP (Model Context Protocol) integration!
