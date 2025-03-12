pol=polcompositum(y^2+26,y^2-229)[1];
pol;
K = bnfinit(pol);
L = subgrouplist(K, [3], 1);
Lpol = vector(#L, k, polredbest(bnrclassfield(K, L[k], 2)));
S = Set(Lpol);
print("#S=",#S);

output_file = "polynomials.txt";
write(output_file, "");

foreach (S,P, print(bnfinit(P).cyc));
{
  for (i = 1, #S, 
  p = S[i];
    for (j = i + 1, #S, 
    q = polredbest(polcompositum(p, S[j])[1]);
    qs = Str(q);
    q_string = strjoin(strsplit(qs, " "));
    print("q[",i,",",j,"] = ", q_string, "\n");
    write(output_file, i, " ", j, " ", q_string);  );
  );
}

    
