## 구성도


<img width="1372" height="762" alt="제목 없는 다이어그램 drawio (1)" src="https://github.com/user-attachments/assets/02a9384c-dec7-44cc-97c4-ec0b703390b2" />


```
프로젝트 루트
├── backend.tf       # 백엔드 설정
├── ec2.tf           # EC2 인스턴스 및 키 설정
├── init.tf          # 초기 구성
├── sg.tf            # 보안 그룹 설정
├── tgw.tf           # Transit Gateway 구성
└── vpc.tf           # VPC 및 서브넷 생성
```
