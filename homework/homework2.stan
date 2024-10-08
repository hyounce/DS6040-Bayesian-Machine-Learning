data {
  int<lower=0> N;
  vector[N] y;
  real<lower=0> sigma;
  real mu0;
  real<lower=0> tau;
}
parameters{
  real mu;
}
model{
  mu ~ normal(mu0, tau);
  y ~ normal(mu, sigma);
}
