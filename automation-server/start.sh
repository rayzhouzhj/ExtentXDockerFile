#!/bin/bash

# Start mongodb and sails
mongod & sails lift & wait
