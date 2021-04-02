nb = 12;
nbm = 12;
mod = 1<<nbm;
mask = 2*(4^(nbm/2)-1)/(4-1);

\\print(mask);

n = read("input.txt");

\\print(n);

chiffre(a) = [a^2%n,kronecker(a,n),a%2];

attaque_chiffre(a) = [a^2%n, -kronecker(a,n), a%2];

dechiffre(c) = read("dec")(c);

m = random(1<<500)<<nb+mask;

i = 43;
z = (i<<nb)+mask;
zp = dechiffre(attaque_chiffre(z));

\\print(zp);
\\print(z);

diff = 0;
gen = 0;
sol = 0;

until(sol, r=(gen<<nb)+mask; rp=dechiffre(attaque_chiffre(r)); if(rp, {diff = r-rp; sol = 1;}, {gen = gen+1;}););

\\print(diff);

q = gcd(diff, n);

print(q);

modulo = n%q;

\\print(modulo);

p = n/q;
\\print(p);

if(dechiffre(chiffre(m)) != m,error("problème d'énoncé à signaler"));

