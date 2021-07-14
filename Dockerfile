FROM python:3.8.5
EXPOSE 8501
WORKDIR /app
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt
RUN pip3 install libglib2.0-0
RUN pip3 install libsm6
RUN pip3 install libxext6
RUN pip3 install libxrender-dev
COPY . .
CMD streamlit run app.py
