# ============================================
# Study OS 자동 배포 (Windows PowerShell 버전)
# 사용법:  ./deploy.ps1 "v2.29 무슨무슨 기능"
#  (메시지 생략하면 자동으로 날짜+시간)
# ============================================
param([string]$msg = "update $(Get-Date -Format 'yyyy-MM-dd HH:mm')")

# study-os.html 안의 버전 자동 추출해서 메시지에 붙이기
$verMatch = Select-String -Path "study-os.html" -Pattern "SYSTEM ONLINE . v([0-9.]+)" | Select-Object -First 1
if ($verMatch) {
    $vstr = $verMatch.Matches[0].Groups[1].Value
    $msg = "$msg (v$vstr)"
}

Write-Host "📦 배포 시작: $msg" -ForegroundColor Yellow

git add -A
git commit -m "$msg"
if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️ 커밋할 변경사항이 없거나 커밋 실패" -ForegroundColor Red
    exit 0
}
git push origin main
if ($LASTEXITCODE -ne 0) { git push origin master }

Write-Host ""
Write-Host "✅ push 완료!" -ForegroundColor Green
Write-Host "🌐 https://leedongg2.github.io/study-os/study-os.html" -ForegroundColor Cyan