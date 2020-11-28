awk '
      {
        if(match($0, "ITEM: ATOMS id"))
        { 
          printf("ITEM: ATOMS id type xs ys zs\n");
        }
        else
        {
          printf("%s\n", $0);
        }
      } ' ./$1/explo.dump > ./$1/explo_newtype.dump