package com.mtwdm.android.transportaappadmin.gui.componentes;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.TextView;

import com.mtwdm.android.transportaappadmin.R;

class ViewHolderRenglonViaje extends RecyclerView.ViewHolder {

    TextView lblOrigen;
    TextView lblDestino;
    TextView lblFecha;

    ViewHolderRenglonViaje(View itemView) {
        super(itemView);

        lblOrigen = itemView.findViewById(R.id.lblOrigen);
        lblDestino = itemView.findViewById(R.id.lblDestino);
        lblFecha = itemView.findViewById(R.id.lblFecha);

    }

}
