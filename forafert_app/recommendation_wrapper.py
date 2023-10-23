class RecommendationWrapper:
    def __init__(self):
        pass

    def format_rules_for_clips(data):

        if isinstance(data, list):
            facts = "(facts "
            for item in data:
                facts += f"({item} \"{item}\") "
            facts += ")"
            
            print(facts)
        else:
            return("")