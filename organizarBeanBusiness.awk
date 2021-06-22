#!/bin/awk -f

BEGIN {
  FS = "[.$]";
}

BEGINFILE {
    printf("sort -t = -k 1,1 -o %1$s %1$s", FILENAME) | "sh";
    close("sh");
}

/^[[:alpha:]].*\./ {
  for (i = 1; i <= NF; i++) {
    if ($i ~ /^[A-Z][a-z].*/) {
      if (nomeDaClasse ~ $i) {
        print $0;
        cnt++;
        next;
      }
      else {
        print "\r\n" $0;
        cnt = 1;
        nomeDaClasse = $i;
      }
    }
  }
}

ENDFILE {
  nomeDaClasse = "";
}
