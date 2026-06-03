# 🐙 GitHub 셋업 가이드 (처음 한 번만)

> 동규야, 나(Claude)는 네 GitHub 계정 토큰이 없어서 **직접 레포를 만들거나 push할 수 없어**.
> (토큰을 채팅에 적는 건 보안상 절대 금지 🙅)
> 그래서 아래 순서대로 **처음 한 번만** 셋업하면, 이후엔 `./deploy.sh` 한 줄로 끝나.

---

## 1단계: GitHub에서 빈 레포 만들기
1. https://github.com/new 접속
2. Repository name: `study-os`
3. **Public** 선택 (GitHub Pages 무료로 쓰려면 Public)
4. README, .gitignore 등 **체크 안 함** (빈 레포)
5. "Create repository" 클릭

## 2단계: 로컬 폴더 셋업 (터미널)
`study-os.html`, `README.md`, `deploy.sh`를 한 폴더에 넣고:

```bash
cd /path/to/study-os-폴더

git init
git add -A
git commit -m "v2.25 first commit"
git branch -M main
git remote add origin https://github.com/leedongg2/study-os.git
git push -u origin main
```

> ⚠️ push할 때 GitHub 로그인(또는 Personal Access Token) 물어봄.
> 토큰 만들기: GitHub → Settings → Developer settings → Personal access tokens → Fine-grained tokens → 이 레포에 `Contents: Read and write` 권한.
> 한 번 입력하면 git이 기억함 (credential helper).

## 3단계: GitHub Pages 켜기 (URL로 접속하려면)
1. 레포 → Settings → Pages
2. Source: `Deploy from a branch`
3. Branch: `main` / `/ (root)` 선택 → Save
4. 1~2분 후 → **https://leedongg2.github.io/study-os/study-os.html** 접속 가능!

이제 폰이든 노트북이든 이 URL로 들어가면 됨. 실시간 동기화까지 켜지면 데이터도 공유됨 🔥

## 4단계: deploy.sh 실행 권한 (한 번만)
```bash
chmod +x deploy.sh
```

---

## 🔁 이후 버전 올릴 때마다 (매번)
1. Claude한테 새 `study-os.html` 받아서 폴더에 덮어쓰기
2. 터미널에서:
```bash
./deploy.sh "v2.26 무슨무슨 기능"
```
끝! 자동으로 커밋 + push + 버전 태깅. GitHub Pages도 1~2분 후 자동 반영.

---

## 💡 참고
- **나(Claude)는 버전 올릴 때마다 자동 push를 못 해** (인증 문제). 매번 `./deploy.sh`는 네가 실행해야 함.
- 대신 새 버전 줄 때마다 "deploy.sh 돌려" 하고 알려줄게.
- 더 자동화하고 싶으면 → GitHub Actions로 빌드 자동화 가능하지만, 단일 HTML이라 굳이 필요 없음.
