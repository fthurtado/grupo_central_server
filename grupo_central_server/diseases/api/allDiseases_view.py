import pandas as pd

from rest_framework import status, viewsets
from rest_framework.permissions import AllowAny
from rest_framework.response import Response


class GetDiseases(viewsets.ModelViewSet):
    permission_classes = [AllowAny]
    http_method_names = ["get"]

    def list(self, *args, **kwargs):
        df = pd.read_csv("Monthly_Counts_of_Deaths_by_Select_Causes__2014-2019.csv")

        # { name[string]: { year[number]: { month[number]: quantity[number]} } }
        diseases = {}

        for name in df:
            if name != "Jurisdiction of Occurrence" \
            and name != "Year" \
            and name != "Month":
                diseases[name] = {"favorite": False}

        for row_index in df.index:
            for name in diseases:
                year = int(df["Year"][row_index])
                month = int(df["Month"][row_index])
                deaths_quantity = int(df[name][row_index])
                # if the year is already in the disease only add the month and deaths quantity to year dict
                if diseases[name].get(year):
                    diseases[name][year][month] = deaths_quantity
                # else create the year dict and add it to the disease
                else:
                    diseases[name][year] = {month: deaths_quantity}

        return Response(diseases, status=status.HTTP_200_OK)
