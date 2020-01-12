
plot(R_CG_Csharehold$Reptdt,R_CG_Csharehold$C0201b)
library(dplyr)
x1<- R_CG_Csharehold %>% select(Reptdt,C0201b,C0101b)
x2<- filter(class =="葛卫东")%>% select(Reptdt,C0201b)
x2 <- x1[x1$C0101b == "葛卫东"]
x2 <- R_CG_Csharehold %>% group_by('葛卫东')
x2 <- group_by(x1,"葛卫东")

x2<- filter(R_CG_Csharehold,C0101b == "葛卫东") #특정 자료만 추출할때쓴다.
x3<- filter(R_CG_Csharehold,C0101b == "中国平安人寿保险股份有限公司-传统-普通保险产品")

library(xts)
library(zoo)
class(x3$Reptdt) # 클레스가 데이터 인지 여부 확인해야 함

x3$data<-as.Date(x3$Reptdt) # 날짜 데이터로 클래스를 변경해야 함
class(x3$data) 

plot(x3$data,x3$C0201b)
# 그룹으로 묶는데 까지는 성공했는데 그래프로 나타 내는것은 연구필요함
x1$data<-as.Date(x1$Reptdt)
x5<-x1 %>% group_by(x1$C0101b) %>% summarize(n())
x6<-x1 %>% group_by(x1$C0101b) %>% summarize(sum=sum(x1$C0201b),median=median(x1$C0201b),n=n())
