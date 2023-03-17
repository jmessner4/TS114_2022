function [segment, P_loc, Q_loc, R_loc, S_loc, T_loc] = ecg_threshold(Signal, R, I_segment);

LongSegment=RRinter(R)(1)