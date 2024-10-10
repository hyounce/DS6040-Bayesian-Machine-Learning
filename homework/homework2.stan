data {
  int<lower=0> N1;
  int<lower=0> N2;
  vector[N1] y1;
  vector[N2] y2;
  
  real<lower=0> mu_sd1;
  real<lower=0> mu_sd2;
  real<lower=0> sigma_scale1;
  real<lower=0> sigma_scale2;
}
parameters{
  real mu1;
  real mu2;
  real<lower=0> sigma1;
  real<lower=0> sigma2;
}
transformed parameters{
  real mu_diff;
  mu_diff = mu1 - mu2;
}
model{
  mu1 ~ normal(0, mu_sd1);
  mu2 ~ normal(0, mu_sd2);
  sigma1 ~ cauchy(0, sigma_scale1);
  sigma2 ~ cauchy(0, sigma_scale2);
  
  y1 ~ normal(mu1, sigma1);
  y2 ~ normal(mu2, sigma2);
}
