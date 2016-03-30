class Has < Base

  def initialize(args)
    # Can be 'netto|pink' OR 'netto | pink' OR ['netto', '|' , 'pink']
    if args.kind_of?(Array)
    args = args.join('')
    end

    @needles = args.split('|')
  end

  def before_handle(account)
  end

  def actual_handle(account)
    account.entries.delete_if { |e|
      @needles.all? { |needle|
        !e.description.downcase.include? needle.downcase
      }
    }
    return nil
  end

  def after_handle(account)
  end

end