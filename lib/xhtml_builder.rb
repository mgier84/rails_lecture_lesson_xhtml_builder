class XHTMLBuilder
  
  attr_accessor :content
  
  def initialize()
    @content = ""
  end

  def check_block(*args)
    if block_given? then
      yield
    else
      unless(args[0].nil?)
        @content << args[0] << "\n"
      end
    end
  end

  def method_missing(sym, *args, &block)
    @content << "<#{sym}>\n"

    check_block(*args, &block)
    
    @content << "</#{sym}>\n"
  end
  
end
