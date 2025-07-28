## 구성도


<img width="1372" height="762" alt="제목 없는 다이어그램 drawio (1)" src="https://github.com/user-attachments/assets/02a9384c-dec7-44cc-97c4-ec0b703390b2" />


```
프로젝트 루트
├── backend.tf       # 백엔드 설정 및 인바운드 규칙
├── ec2.tf           # EC2 인스턴스 및 키 설정
├── init.tf          # 초기 VPC 및 서브넷 구성
├── sg.tf            # 보안 그룹 설정 (SSH/ICMP 등)
├── tgw.tf           # Transit Gateway 및 라우팅 구성
└── vpc.tf           # VPC 및 서브넷 생성
```
