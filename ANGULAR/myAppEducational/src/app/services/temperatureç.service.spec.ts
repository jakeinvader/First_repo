import { TestBed } from '@angular/core/testing';

import { TemperatureçService } from './temperatureç.service';

describe('TemperatureçService', () => {
  let service: TemperatureçService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TemperatureçService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
