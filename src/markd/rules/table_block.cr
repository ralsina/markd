module Markd::Rule
  struct Table
    include Rule

    def match(parser : Parser, container : Node) : MatchValue
      MatchValue::None
    end

    def token(parser : Parser, container : Node) : Nil
    end

    def continue(parser : Parser, container : Node) : ContinueStatus
      (parser.blank && {5, 6}.includes?(container.data["html_block_type"])) ? ContinueStatus::Stop : ContinueStatus::Continue
    end

    def can_contain?(type)
      false
    end

    def accepts_lines? : Bool
      true
    end
  end
end
