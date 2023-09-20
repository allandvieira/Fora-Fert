import os
import subprocess

class RecommendationWrapper:
    def __init__(self):
        pass

    def format_rules_for_clips(data):

        try:
            forage = data['forage']
            ph = data['ph']
            organic_matter = data['organicmatter']
            p = data['p']
            k = data['k']
            ca = data['ca']
            mg = data['mg']
            v_sat= data['v_sat']
            al_sat = data['al_sat']

            anual_perenial = ""
            if data['is_perene'] == "perene":
                anual_perenial = 1
            else:
                anual_perenial = 0

            first_planting= ""
            if data['is_firstplanting'] == "yes":
                first_planting = 1
            else 
                first_planting = 0

            use_type = data['usetype']

            rules = f"""
            (assert (forage {forage}))
            (assert (ph {ph}))
            (assert (organicmatter {organic_matter}))
            (assert (p-value {p}))
            (assert (k-value {k}))
            (assert (ca {ca}))
            (assert (mg {mg}))
            (assert (base-saturation {v_sat}))
            (assert (aluminium-saturation {al_sat}))
            (assert (perene {anual_perenial}))
            (assert (first-planting {first_planting}))
            (assert (use-type {use_type}))
            """

            return rules

        except Exception as e:
            print(e)
            return ""

    def run_clips():
        command = ['clips', '-f', 'main.clp']
        process = subprocess.Popen(command,
                                   stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = process.communicate()

        return stdout

