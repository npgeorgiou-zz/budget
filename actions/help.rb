class Help < Base

  def run(arguments)
    # Print instructions
    string = 'help for help'                                       + "\n"
    string+= 'list to list'                                        + "\n"
    string+= 'sum to sum'                                          + "\n"
    string+= ' -sv <path>       Saves result to absolute location' + "\n"
    string+= ' -fr <date>       Filters by from'                   + "\n"
    string+= ' -to <date>       Filters by to'                     + "\n"
    string+= ' -hs <s|s>        Filters by text'                   + "\n"
    string+= ' -in              Present only income'               + "\n"
    string+= ' -ex              Present only expenses'             + "\n"
    string+= ' -am <symbol int> Filters by absolute amount'        + "\n"

    return string.blue
  end

end