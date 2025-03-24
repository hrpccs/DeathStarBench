# sudo kubectl get service | grep frontend to get the ip of frontend service 
# code here to get the ip of frontend service
FRONTEND_IP=$(sudo kubectl get service frontend -o jsonpath='{.spec.clusterIP}')
echo "Frontend service IP: $FRONTEND_IP"


../wrk2/wrk -D exp -t 2 -c 2 -d 30 -L -s ./wrk2/scripts/hotel-reservation/mixed-workload_type_1.lua http://$FRONTEND_IP:5000 -R 2