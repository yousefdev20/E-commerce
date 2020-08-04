<?php

namespace TCG\Voyager\FormFields;

class MapHandler extends AbstractHandler
{
    protected $codename = 'map';

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {
        return view('voyager::formfields.map', [
            'row'             => $row,
            'options'         => $options,
            'dataType'        => $dataType,
            'dataTypeContent' => $dataTypeContent,
        ]);
    }
}
