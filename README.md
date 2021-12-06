
구글에서 이미지 스크래핑

powershell로 구글 검색어, 스크래핑 이미지 개수 설정
--------------------------------------------------
[Environment]::SetEnvironmentVariable('SEARCH_TEXT', 'cute cat img', 'User');

[Environment]::SetEnvironmentVariable('IMG_CNT', '100', 'User');


cmd에서 아래 명령어로 스크래핑 시작
--------------------------------------------------
run rcc