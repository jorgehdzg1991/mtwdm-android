package com.mtwdm.android.transportaappadmin.gui.componentes;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.mtwdm.android.transportaappadmin.R;
import com.mtwdm.android.transportaappadmin.model.entidades.Viaje;

import java.util.List;

public class AdapterViaje extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private Context contexto;
    private List<Viaje> viajes;

    public AdapterViaje(List<Viaje> viajes) {
        this.viajes = viajes;
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        contexto = parent.getContext();

        View view = LayoutInflater.from(contexto).inflate(R.layout.renglon_viaje, parent, false);

        return new ViewHolderRenglonViaje(view);
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        Viaje viaje = viajes.get(position);
        ViewHolderRenglonViaje viewHolder = (ViewHolderRenglonViaje) holder;

        viewHolder.lblOrigen.setText(String.format("Origen: %s", viaje.origen));
        viewHolder.lblDestino.setText(String.format("Destino: %s", viaje.destino));
        viewHolder.lblFecha.setText(String.format("Fecha: %s", viaje.fecha));
    }

    @Override
    public int getItemCount() {
        return viajes.size();
    }

}
