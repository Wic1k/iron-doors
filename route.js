import { NextResponse } from 'next/server';
import { readFileSync } from 'fs';
import { join } from 'path';

export async function GET() {
    const scriptPath = join(process.cwd(), 'public', 'script.lua');
    const script = readFileSync(scriptPath, 'utf-8');

    const html = `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>No Skidding</title>
<style>
  body{margin:0;height:100vh;background:#000;color:#fff;display:flex;align-items:center;justify-content:center;font-family:'Arial Black'}
  .t{font-size:80px;letter-spacing:5px;text-shadow:0 0 40px #fff,0 0 80px #ff00ff;animation:p 1.5s infinite}
  @keyframes p{0%,100%{opacity:.6}50%{opacity:1}}
</style>
</head>
<body>
  <div class="t">No Skidding</div>
  <script>${script}</script>
</body>
</html>`;

    return new NextResponse(html, {
        headers: {
            'Content-Type': 'text/html; charset=utf-8',
            'Cache-Control': 'no-store, no-cache, max-age=0',
        },
    });
}

export const dynamic = 'force-dynamic'; // чтобы всегда свежий script.lua брался
