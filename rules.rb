class Rules
  def self.rules
    all_rules = {
      A: {
          math_method: :%,
          condition: 3,
          discount: 15,
        },

      B: {
          math_method: :%,
          condition: 2,
          discount: 5,
        },

      total: {
          math_method: :>,
          condition: 150,
          discount: 20
        }
      }

        rules = all_rules
      end
end