#!/bin/bash
# ============================================
# Study OS 자동 배포 스크립트
# 사용법: ./deploy.sh "v2.25 실시간 동기화"
#  (메시지 생략하면 자동으로 날짜+시간 커밋)
# ============================================

# 커밋 메시지 (인자 없으면 현재 시각)
MSG="${1:-update $(date '+%Y-%m-%d %H:%M')}"

# study-os.html 안의 버전 자동 추출해서 메시지에 붙이기
VER=$(grep -o 'SYSTEM ONLINE · v[0-9.]*' study-os.html | head -1 | grep -o 'v[0-9.]*')
if [ -n "$VER" ]; then
  MSG="$MSG ($VER)"
fi

echo "📦 배포 시작: $MSG"

git add -A
git commit -m "$MSG" || { echo "⚠️ 커밋할 변경사항 없음"; exit 0; }
git push origin main || git push origin master

echo ""
echo "✅ push 완료!"
echo "🌐 GitHub Pages: https://leedongg2.github.io/study-os/study-os.html"
echo "   (Pages 켜져 있으면 1~2분 후 반영)"
