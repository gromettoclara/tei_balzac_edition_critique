from collatex import *

with open('witnesses/petites_miseres_furne_consult.txt') as f:
    furne = " ".join(f.readlines())
with open('witnesses/consultation.txt') as f:
    caricature = " ".join(f.readlines())

collation = Collation()
collation.add_plain_witness("F", furne)
collation.add_plain_witness("C", caricature)

alignment_table = collate(collation, output="tei", segmentation=False, near_match=True)

with open("collation.xml", "w") as output:
    output.write(alignment_table.replace("<app>", "\n<app>"))
