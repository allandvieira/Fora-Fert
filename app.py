from flask import Flask, request, jsonify
import os
from forafert_app import recommendation_wrapper

def run_clips(facts):


app = Flask(__name__)

# Endpoint para a requisição POST
@app.route('/getRecommendation', methods=['POST'])
def get_recommendation():
    wrapper = recommendation_wrapper.RecommendationWrapper()
    try:
        data = request.get_json()

        # Verifique se os parâmetros necessários foram fornecidos
        # TODO("lembrar de checar os parâmetros depois")

        soil_type = data['soiltype']
        soil_ph = data['soilph']
        organic_matter_content = data['organicmattercontent']
        content_p = data['p']
        content_k = data['k']
        content_ca = data['ca']
        content_mg = data['mg']
        base_saturation = data['basesaturation']
        aluminum_saturation = data['aluminumsaturation']
        type_of_forage = data['typeofforage']
        annual_or_perennial_culture = data['annualorperennialculture']
        first_planting_of_the_crop = data['firstplantingofthecrop']
        plantation_use_type = data['plantationusetype']

        data = [soil_type, soil_ph, organic_matter_content_in_the_soil, content_p, content_k, content_ca, content_mg, base_saturation, aluminum_saturation, type_of_forage, annual_or_perennial_culture, first_planting_of_the_crop, plantation_use_type]

        formatted_result = wrapper.format_rules_for_clips(data)

        # Salve o resultado formatado em um arquivo .clp
        file_path = "./clips/fatosfile.clp"
        try:
        # Abre o arquivo em modo de escrita (ou cria o arquivo se ele não existir)
            with open(file_path, 'w') as file:
                file.write(formatted_result)
            print("String escrita com sucesso no arquivo:", file_path)
        except IOError as e:
            print("Ocorreu um erro ao escrever no arquivo:", str(e))

        message_return = run_clips(formatted_result)

        return jsonify({"message": "Dados formatados e salvos com sucesso"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
