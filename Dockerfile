FROM cccs/assemblyline-v4-service-base:stable

# Python path to the service class from your service directory
#  The following example refers to the class "Sample" from the "speakeasyEmulator.py" file
ENV SERVICE_PATH speakeasyEmulator.SpeakeasyEmulator

# Install any service dependencies here
# For example: RUN apt-get update && apt-get install -y libyaml-dev
#
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir --user --requirement requirements.txt && rm -rf ~/.cache/pip

# Switch to assemblyline user
USER assemblyline

# Copy Sample service code
WORKDIR /opt/al_service
COPY . .