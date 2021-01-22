#Sinan Urgun(G171210015)1. Öğretim A gurubu

rm(list=ls()) # önceden depolanan tüm değişkenleri kaldırır
library(Hmisc) 

data <- read.csv("C:/Users/emine/Desktop/big datga/COVID19_line_list_data.csv")  # bu kısım COVID19_line_list_data bu dosyanın aderesi
describe(data) # Hmisc komutu

# ölüm sütunu
data$death_dummy <- as.integer(data$death != 0)
# ölüm oranı
sum(data$death_dummy) / nrow(data)

# YAŞ
# iddia: ölen insanlar daha yaşlı
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
# bu istatistiksel olarak anlamlı mı?
t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.99)
# normalde, p değeri <0,05 ise, boş hipotezi reddederiz
# burada, p-değeri ~ 0, dolayısıyla sıfır hipotezini reddediyoruz ve
# bunun istatistiksel olarak anlamlı olduğuna vardık

# CİNSİYET
# iddia: cinsiyetin etkisi yoktur
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE) #8.5%!
mean(women$death_dummy, na.rm = TRUE) #3.7%
# bu istatistiksel olarak anlamlı mı?
t.test(men$death_dummy, women$death_dummy, alternative="two.sided", conf.level = 0.99)
# % 99 güven: erkeklerin% 0,8 ila% 8,8 daha yüksek şansı var
# p-değeri = 0,002 <0,05, dolayısıyla bu istatistiksel olarak anlamlı








