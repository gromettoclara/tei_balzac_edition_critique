from collatex import *

with open('witnesses/raphFurne.txt') as f:
    Furne = " ".join(f.readlines())
with open('witnesses/raphR2M.txt') as f:
    R2M = " ".join(f.readlines())

collation = Collation()
collation.add_plain_witness("F", Furne)
collation.add_plain_witness("R2M", R2M)

alignment_table = collate(collation, output="tei", segmentation=False, near_match=True)

with open("collation2.xml", "w") as output:
    output.write(alignment_table.replace("<app>", "\n<app>"))
