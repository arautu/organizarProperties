#!/bin/awk -f

BEGIN {
  FS = ".";
}

BEGINFILE {
    printf("sort -t = -k 1,1 -o %1$s %1$s", FILENAME) | "sh";
    close("sh");
    nomeDaView = "";
}

/^[[:alpha:]].*\./ {
  for (i = 1; i <= NF; i++) {
    if ($i ~ /^[A-Z][a-z].+/) {
      i++; 
      if (match(nomeDaView, "\\<"$i"\\>")) {
        printf "%s%s", $0, RT;
        break;
      }
      else {
        printf "\r\n%s%s", $0, RT; 
        nomeDaView = $i;
        break;
      }
    }
  }
}
