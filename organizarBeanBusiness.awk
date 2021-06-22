#!/bin/awk -f

BEGIN {
  FS = "[.$]"
  printf("sort -t = -k 1,1 -o %1$s %1$s", ARGV[1]) | "sh"
  close("sh")
}

/^[[:alpha:]].*\./ {
  for (i = 1; i <= NF; i++) {
    if ($i ~ /^[A-Z][a-z].*/) {
      if (nomeDaClasse ~ $i) {
        print $0
        cnt++;
        next;
      }
      else {
        print "\n" $0
        cnt = 1;
        nomeDaClasse = $i;
      }
    }
  }
}

END {


}
