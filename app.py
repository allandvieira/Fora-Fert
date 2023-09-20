from flask import Flask, request, jsonify
import os
from forafert_app import recommendation_wrapper as wrp

# Porta para o servidor backend:
SERVER_PORT = 3456

FILE_RULES_PATH = "./clips/src/facts.clp"

app = Flask(__name__)

@app.route('/getRecommendation', methods=['POST'])
def get_recommendation():
    wrapper = wrp.RecommendationWrapper()
    try:
        data = request.get_json()

        rules = wrapper.format_rules_for_clips(data)

        try:
            with open(FILE_RULES_PATH, 'w') as file:
                file.write(rules)
            print("Rules writed", file_path)

        except IOError as e:
            print(str(e))

        message_return = wrapper.run_clips()
        return jsonify({"message": message_return}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
