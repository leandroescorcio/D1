> library(readxl)
> IBOVDIA_Trabalhada_ <- read_excel("C:/Users/lucas/OneDrive/USJT/6° Semestre/Econometria Avançada/IBOVDIA (Trabalhada).xlsx")
> View(IBOVDIA_Trabalhada_)
> temporal <- ts(IBOVDIA_Trabalhada_, start = 6641.18, frequency = 1)
> plot(temporal)
> plot(IBOVDIA_Trabalhada_$PREGÃO)
> plot(IBOVDIA_Trabalhada_$PREGÃO)
> plot(IBOVDIA_Trabalhada_$PREGÃO, type = "l")
> colnames (IBOVDIA_Trabalhada_) [1] <- "DATA"
> install.packages("urca")
Installing package into 'C:/Users/lucas/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/urca_1.3-0.zip'
Content type 'application/zip' length 1061148 bytes (1.0 MB)
downloaded 1.0 MB

package 'urca' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\lucas\AppData\Local\Temp\Rtmp6f5epA\downloaded_packages
> library(urca)
> library("urca")
> IBOVDIA_Trabalhada_ <- IBOVDIA_Trabalhada_[,-1]
> View(temporal)
> temporal <- temporal [,-1]
> colnames(temporal)
NULL
> colnames(temporal) [1] <- "PREGÃO"
> TesteDF_PREGAO_none <- ur.df(temporal, "none", lags = 0)
> summary(TesteDF_PREGAO_none)

############################################### 
# Augmented Dickey-Fuller Test Unit Root Test # 
############################################### 

Test regression none 


Call:
  lm(formula = z.diff ~ z.lag.1 - 1)

Residuals:
  Min       1Q   Median       3Q      Max 
-108.260  -28.992    5.824   27.127   83.482 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
z.lag.1 0.000177   0.001584   0.112    0.912

Residual standard error: 45.62 on 18 degrees of freedom
Multiple R-squared:  0.0006938,	Adjusted R-squared:  -0.05482 
F-statistic: 0.0125 on 1 and 18 DF,  p-value: 0.9122


Value of test-statistic is: 0.1118 

Critical values for test statistics: 
  1pct  5pct 10pct
tau1 -2.66 -1.95  -1.6

> TesteDF_PREGAO_drift <- ur.df(temporal, "drift", lags = 0)
> summary(TesteDF_PREGAO_drift)

############################################### 
# Augmented Dickey-Fuller Test Unit Root Test # 
############################################### 

Test regression drift 


Call:
  lm(formula = z.diff ~ z.lag.1 + 1)

Residuals:
  Min      1Q  Median      3Q     Max 
-91.010 -24.589   7.091  28.213  62.906 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
(Intercept) 1994.1946  1188.3397   1.678    0.112
z.lag.1       -0.3015     0.1798  -1.677    0.112

Residual standard error: 43.48 on 17 degrees of freedom
Multiple R-squared:  0.142,	Adjusted R-squared:  0.09149 
F-statistic: 2.813 on 1 and 17 DF,  p-value: 0.1118


Value of test-statistic is: -1.6771 1.4149 

Critical values for test statistics: 
  1pct  5pct 10pct
tau2 -3.75 -3.00 -2.63
phi1  7.88  5.18  4.12

> TesteDF_PREGAO_trend <- ur.df(temporal, "trend", lags = 0)
> summary(TesteDF_PREGAO_trend)

############################################### 
# Augmented Dickey-Fuller Test Unit Root Test # 
############################################### 

Test regression trend 


Call:
  lm(formula = z.diff ~ z.lag.1 + 1 + tt)

Residuals:
  Min      1Q  Median      3Q     Max 
-87.721 -24.949   8.591  28.340  61.524 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
(Intercept) 1867.6620  1248.8492   1.496    0.154
z.lag.1       -0.2837     0.1883  -1.506    0.151
tt             0.8633     1.9077   0.453    0.657

Residual standard error: 44.54 on 16 degrees of freedom
Multiple R-squared:  0.1528,	Adjusted R-squared:  0.04691 
F-statistic: 1.443 on 2 and 16 DF,  p-value: 0.2654


Value of test-statistic is: -1.5064 0.9674 1.4429 

Critical values for test statistics: 
  1pct  5pct 10pct
tau3 -4.38 -3.60 -3.24
phi2  8.21  5.68  4.67
phi3 10.61  7.24  5.91

> col1_PREGAO <- c("", -1.95, "", -3.00, -3.00, "", -3.60, -3.60, 3.60)
> col2_PREGAO <- c("", 0.112, "", -1.677, 1.678, "", -1.506, 1.496, 0.453)
> col3_PREGAO <- c("", 0.912, "", 0.112, 0.112, "", 0.151, 0.154, 0.657)
> Resultado_PREGAO <- cbind(col1_PREGAO, col2_PREGAO, col3_PREGAO)
> colnames(Resultado_PREGAO) <- c("T Crítico", "Estatística T", "P-valor")
> rownames(Resultado_PREGAO) <- c("SEM CONSTANTE E SEM TENDÊNCIA", "Yt-1", "COM CONSTANTE", "Yt-1", "Drift", "COM CONSTANTE E COM TENDÊNCIA", "Yt-1", "Drift", "Trend")
> View(Resultado_PREGAO)
> col1_PREGAO <- c("", -1.95, "", -3.00, -3.00, "", -3.60, -3.60, -3.60)
> Resultado_PREGAO <- cbind(col1_PREGAO, col2_PREGAO, col3_PREGAO)
> colnames(Resultado_PREGAO) <- c("T Crítico", "Estatística T", "P-valor")
> rownames(Resultado_PREGAO) <- c("SEM CONSTANTE E SEM TENDÊNCIA", "Yt-1", "COM CONSTANTE", "Yt-1", "Drift", "COM CONSTANTE E COM TENDÊNCIA", "Yt-1", "Drift", "Trend")
> View(Resultado_PREGAO)
> write.csv(Resultado_PREGAO, file = "Resultado_PREGAO.csv")
> TesteDF_PREGAO_none
                                                               
############################################################### 
# Augmented Dickey-Fuller Test Unit Root / Cointegration Test # 
############################################################### 
                                                               
The value of the test statistic is: 0.1118 
                                                               
> acf(temporal)
> pacf(temporal)
> acf(temporal, main="Pregão")
> pacf(temporal, main="Pregão")
> AR1 <- arima(temporal, order = c(1,0,0))
> AR1
                                                               
Call:
   arima(x = temporal, order = c(1, 0, 0))
                                                               
Coefficients:
  ar1  intercept
0.6759  6619.0866
s.e.  0.1571    25.6606
                                                               
sigma^2 estimated as 1625:  log likelihood = -102.62,  aic = 211.24
> MA1 <- arima(temporal, order = c(0,0,1))
> MA1
                                                               
Call:
  arima(x = temporal, order = c(0, 0, 1))
                                                               
Coefficients:
  ma1  intercept
0.4861  6613.1467
s.e.  0.1507    14.9877
                                                               
sigma^2 estimated as 2100:  log likelihood = -105.01,  aic = 216.02
> MA2 <- arima(temporal, order = c(0,0,2))
> MA2
                                                               
Call:
   arima(x = temporal, order = c(0, 0, 2))
                                                               
Coefficients:
  ma1     ma2  intercept
0.7473  0.7843  6618.2553
s.e.  0.2129  0.2348    19.5252
                                                               
sigma^2 estimated as 1285:  log likelihood = -101.01,  aic = 210.03
> ARMA11 <- arima(temporal, order = c(1,0,1))
> ARMA11
                                                               
Call:
  arima(x = temporal, order = c(1, 0, 1))
                                                               
Coefficients:
  ar1      ma1  intercept
0.6778  -0.0036  6619.1278
s.e.  0.2026   0.2409    25.8563
                                                               
sigma^2 estimated as 1625:  log likelihood = -102.62,  aic = 213.24
> ARMA12 <- arima(temporal, order = c(1,0,2))
> ARMA12
                                                               
Call:
  arima(x = temporal, order = c(1, 0, 2))
                                                               
Coefficients:
  ar1     ma1     ma2  intercept
0.1420  0.6416  0.7179  6618.6464
s.e.  0.3579  0.3387  0.2846    21.1812
                                                               
sigma^2 estimated as 1293:  log likelihood = -100.94,  aic = 211.88
> AIC (AR1)
[1] 211.2389
> BIC (AR1)
[1] 214.2261
> BIC (MA1)
[1] 219.0103
> AIC (MA1)
[1] 216.0231
> AIC (MA2)
[1] 210.0281
> BIC (MA2)
[1] 214.011
> AIC (ARMA11)
[1] 213.2386
> BIC (ARMA11)
[1] 217.2216
> AIC (ARMA12)
[1] 211.8751
> BIC (ARMA12)
[1] 216.8538
> estimacoes <- list (AR1, MA1, MA2, ARMA11, ARMA12)
> sapply(estimacoes, AIC)
[1] 211.2389 216.0231 210.0281 213.2386 211.8751
> sapply(estimacoes, BIC)
[1] 214.2261 219.0103 214.0110 217.2216 216.8538
> AIC <- sapply(estimacoes, AIC)
> BIC <- sapply(estimacoes, BIC)
> Modelo <- c("AR1", "MA1", "MA2", "ARMA11", "ARMA12")
> Resultados <- data.frame (Modelo, AIC, BIC)
> View (Resultados)
> write.csv (Resultados, file = "Resultados.csv")
> plot(TesteDF_PREGAO_none)
> plot(TesteDF_PREGAO_drift)
> plot(TesteDF_PREGAO_trend)