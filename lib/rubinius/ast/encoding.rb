# -*- encoding: us-ascii -*-

module Rubinius::ToolSet.current::TS
  module AST
    class Encoding < Node
      attr_accessor :name

      def initialize(line, name)
        @line = line
        @name = name
      end

      def bytecode(g)
        pos(g)

        g.push_literal Compiler::Runtime
        g.push_literal @name
        g.send :get_encoding, 1
      end

      def defined(g)
        g.push_literal "expression"
      end

      def to_sexp
        [:encoding, @name]
      end
    end
  end
end
