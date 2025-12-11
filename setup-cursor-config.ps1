# Script to create Cursor MCP configuration file
$configDir = Join-Path $env:USERPROFILE ".cursor"
$configPath = Join-Path $configDir "mcp.json"

# Create .cursor directory if it doesn't exist
if (-not (Test-Path $configDir)) {
    New-Item -ItemType Directory -Path $configDir -Force | Out-Null
    Write-Host "Created directory: $configDir"
}

# Server configuration
$config = @{
    mcpServers = @{
        "playwright-browser" = @{
            command = "node"
            args = @("D:\Sumit\Code\vibe\mcp-practice\src\server.js")
            cwd = "D:\Sumit\Code\vibe\mcp-practice"
        }
    }
} | ConvertTo-Json -Depth 10

# Write configuration file
Set-Content -Path $configPath -Value $config -Encoding UTF8

Write-Host "`nConfiguration file created successfully!"
Write-Host "Location: $configPath"
Write-Host "`nPlease restart Cursor for the changes to take effect.`n"
