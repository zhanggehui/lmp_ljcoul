awk '
      BEGIN{ 
        Section1=0;Section2=0;
      }
      {
        if(match($0, "ITEM"))
        { 
          Section1=0;Section2=0;
          if (match($0, "NUMBER OF ATOMS"))
          {
            Section1=1;Section2=0;
          }
          else if (match($0, "v_reltime_random"))
          {
            Section1=0;Section2=1;
          }
        }
        else if (Section1)
        {
          printf("%s\n", $0);
        }
        else if(Section2)
        {
          printf("%s\n", $0);
        }
      } ' relax_random.dump > relax_random.atomfile